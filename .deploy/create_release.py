#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
***************************************************************************
    create_release.py
    ---------------------
    Date                 : October 2017
    Copyright            : (C) 2017 by Matthias Kuhn
    Email                : matthias@opengis.ch
***************************************************************************
*                                                                         *
*   This program is free software; you can redistribute it and/or modify  *
*   it under the terms of the GNU General Public License as published by  *
*   the Free Software Foundation; either version 2 of the License, or     *
*   (at your option) any later version.                                   *
*                                                                         *
***************************************************************************
"""

__author__ = 'Matthias Kuhn'
__date__ = 'October 2017'
__copyright__ = '(C) 2017, Matthias Kuhn'
# This will get replaced with a git SHA1 when you do a git archive
__revision__ = '$Format:%H$'


import http.client
import os
import json
import subprocess


def create_dumps():
    files = []

    # Create data-only dumps (with sample data)

    dump = 'qwat_v{version}_data_only_sample.backup'.format(
        version=os.environ['TRAVIS_TAG'])
    print('travis_fold:start:{}'.format(dump))
    print('Creating dump {}'.format(dump))
    dumpfile = '/tmp/{dump}'.format(dump=dump)
    subprocess.call(['pg_dump',
                     '--format', 'custom',
                     '--blobs',
                     '--section', 'data',
                     '--compress', '5',
                     '--verbose',
                     '--file', dumpfile,
                     '--schema', 'qwat_dr',
                     '--schema', 'qwat_od',
                     'qwat_prod']
                    )
    files.append(dumpfile)
    print('travis_fold:end:{}'.format(dump))

    dump='qwat_v{version}_data_only_sample.sql'.format(
        version=os.environ['TRAVIS_TAG'])
    print('travis_fold:start:{}'.format(dump))
    print('Creating dump {}'.format(dump))
    dumpfile='/tmp/{dump}'.format(dump=dump)

    subprocess.call(['pg_dump',
                     '--format', 'plain',
                     '--blobs',
                     '--section', 'data',
                     '--verbose',
                     '--file', dumpfile,
                     '--schema', 'qwat_dr',
                     '--schema', 'qwat_od',
                     'qwat_prod']
                    )
    files.append(dumpfile)
    print('travis_fold:end:{}'.format(dump))

    # Create data + structure dumps (with sample data)

    dump='qwat_v{version}_data_and_structure_sample.backup'.format(
        version=os.environ['TRAVIS_TAG'])
    print('travis_fold:start:{}'.format(dump))
    print('Creating dump {}'.format(dump))
    dumpfile='/tmp/{dump}'.format(dump=dump)

    subprocess.call(['pg_dump',
                     '--format', 'custom',
                     '--blobs',
                     '--compress', '5',
                     '--verbose',
                     '--file', dumpfile,
                     '-N', 'public',
                     'qwat_prod']
                    )
    files.append(dumpfile)
    print('travis_fold:end:{}'.format(dump))

    dump='qwat_v{version}_data_and_structure_sample.sql'.format(
        version=os.environ['TRAVIS_TAG'])
    print('travis_fold:start:{}'.format(dump))
    print('Creating dump {}'.format(dump))
    dumpfile='/tmp/{dump}'.format(dump=dump)

    subprocess.call(['pg_dump',
                     '--format', 'plain',
                     '--blobs',
                     '--verbose',
                     '--file', dumpfile,
                     '-N', 'public',
                     'qwat_prod']
                    )
    files.append(dumpfile)
    print('travis_fold:end:{}'.format(dump))

    # Create structure-only dumps

    dump='qwat_v{version}_structure_only.backup'.format(
        version=os.environ['TRAVIS_TAG'])
    print('travis_fold:start:{}'.format(dump))
    print('Creating dump {}'.format(dump))
    dumpfile='/tmp/{dump}'.format(dump=dump)

    subprocess.call(['pg_dump',
                     '--format', 'custom',
                     '--schema-only',
                     '--verbose',
                     '--file', dumpfile,
                     '-N', 'public',
                     'qwat_prod']
                    )
    files.append(dumpfile)
    print('travis_fold:end:{}'.format(dump))

    dump='qwat_v{version}_structure_only.sql'.format(
        version=os.environ['TRAVIS_TAG'])
    print('travis_fold:start:{}'.format(dump))
    print('Creating dump {}'.format(dump))
    dumpfile='/tmp/{dump}'.format(dump=dump)

    subprocess.call(['pg_dump',
                     '--format', 'plain',
                     '--schema-only',
                     '--verbose',
                     '--file', dumpfile,
                     '-N', 'public',
                     'qwat_prod']
                    )
    files.append(dumpfile)
    print('travis_fold:end:{}'.format(dump))

    # Create value-list data only dumps (the qwat_vl schema)

    dump = 'qwat_v{version}_value_list_data_only.backup'.format(
        version=os.environ['TRAVIS_TAG'])
    print('travis_fold:start:{}'.format(dump))
    print('Creating dump {}'.format(dump))
    dumpfile = '/tmp/{dump}'.format(dump=dump)
    subprocess.call(['pg_dump',
                     '--format', 'custom',
                     '--blobs',
                     '--compress', '5',
                     '--data-only',
                     '--verbose',
                     '--file', dumpfile,
                     '--schema', 'qwat_vl',
                     'qwat_prod']
                    )
    files.append(dumpfile)
    print('travis_fold:end:{}'.format(dump))

    dump='qwat_v{version}_value_list_data_only_sample.sql'.format(
        version=os.environ['TRAVIS_TAG'])
    print('travis_fold:start:{}'.format(dump))
    print('Creating dump {}'.format(dump))
    dumpfile='/tmp/{dump}'.format(dump=dump)

    subprocess.call(['pg_dump',
                     '--format', 'plain',
                     '--blobs',
                     '--data-only',
                     '--verbose',
                     '--file', dumpfile,
                     '--schema', 'qwat_vl',
                     'qwat_prod']
                    )
    files.append(dumpfile)
    print('travis_fold:end:{}'.format(dump))

    return files


def main():
    if 'TRAVIS_TAG' not in os.environ or not os.environ['TRAVIS_TAG']:
        print('No git tag: not deploying anything')
        return
    elif os.environ['TRAVIS_SECURE_ENV_VARS'] != 'true':
        print('No secure environment variables: not deploying anything')
        return
    else:
        print('Creating release from tag {}'.format(os.environ['TRAVIS_TAG']))

    release_files=create_dumps()

    conn=http.client.HTTPSConnection('api.github.com')

    headers={
        'User-Agent': 'Deploy-Script',
        'Authorization': 'token {}'.format(os.environ['GH_TOKEN'])
    }

    raw_data={
        "tag_name": os.environ['TRAVIS_TAG']
    }

    data=json.dumps(raw_data)
    url='/repos/{repo_slug}/releases'.format(
        repo_slug=os.environ['TRAVIS_REPO_SLUG'])
    conn.request('POST', url, body=data, headers=headers)
    response=conn.getresponse()
    release=json.loads(response.read().decode())

    if 'upload_url' not in release:
        print('Failed to create release!')
        print('Github API replied:')
        print('{} {}'.format(response.status, response.reason))
        print(repr(release))
        exit(-1)

    conn=http.client.HTTPSConnection('uploads.github.com')
    for release_file in release_files:
        _, filename=os.path.split(release_file)
        headers['Content-Type']='text/plain'
#        headers['Transfer-Encoding']='gzip'
        url='{release_url}?name={filename}'.format(release_url=release['upload_url'][:-13], filename=filename)
        print('Upload to {}'.format(url))

        with open(release_file, 'rb') as f:
            conn.request('POST', url, f, headers)

        response = conn.getresponse()
        result = response.read()
        if response.status != 201:
            print('Failed to upload filename {filename}'.format(filename=filename))
            print('Github API replied:')
            print('{} {}'.format(response.status, response.reason))
            print(repr(json.loads(result.decode())))


if __name__ == "__main__":
    main()
