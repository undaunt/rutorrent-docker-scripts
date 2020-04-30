#!/bin/bash

# Set default rutorrent lsio path
rutorrent_path="/app/rutorrent"

echo "*** Checking for filemanager config ***"
if [ ! -f $rutorrent_path/plugins/filemanager/conf.php ]
then
	echo "*** Installing filemanager ***"
	cd $rutorrent_path/plugins/
	svn co https://github.com/nelu/rutorrent-thirdparty-plugins/trunk/filemanager

	echo "*** Applying default configurations ***"
	cat > $rutorrent_path/plugins/filemanager/conf.php << EOF
<?php
\$fm['tempdir'] = '/tmp';                // path were to store temporary data ; must be writable
\$fm['mkdperm'] = 755;           // default permission to set to new created directories
// set with fullpath to binary or leave empty
\$pathToExternals['rar'] = '$(which rar)';
\$pathToExternals['zip'] = '$(which zip)';
\$pathToExternals['unzip'] = '$(which unzip)';
\$pathToExternals['tar'] = '$(which tar)';
\$pathToExternals['bzip2'] = '$(which bzip2)';
// archive mangling, see archiver man page before editing
\$fm['archive']['types'] = array('rar', 'zip', 'tar', 'gzip', 'bzip2');
\$fm['archive']['compress'][0] = range(0, 5);
\$fm['archive']['compress'][1] = array('-0', '-1', '-9');
\$fm['archive']['compress'][2] = \$fm['archive']['compress'][3] = \$fm['archive']['compress'][4] = array(0);
?>
EOF

chown -R abc:abc $rutorrent_path/plugins/filemanager
chmod -R 775 $rutorrent_path/plugins/filemanager/scripts

else
	echo "*** Updating filemanager ***"
	cd $rutorrent_path/plugins/
	svn co https://github.com/nelu/rutorrent-thirdparty-plugins/trunk/filemanager
fi
