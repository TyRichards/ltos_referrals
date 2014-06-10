<?php
header('Content-disposition: attachment; filename=referrals_desktop_icon.zip');
header("Content-type: application/webloc");
readfile('http://laketravisoralsurgery.net/referrals/wp-content/themes/toolbox/downloadable/referrals_desktop_icon.zip');
?>