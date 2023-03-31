<?php
// Set the path to your Laravel installation
$path = '/home/customer/www/site.vinovino.ca/public_html/';

// Change to the Laravel directory
chdir($path);

// Set the PHP binary path
$php_binary = '/usr/local/php81/bin/php-cli';

// Retry all failed jobs
shell_exec($php_binary . ' artisan queue:retry all');

// Execute the queue:work command using PHP's shell_exec function
$output = shell_exec($php_binary . ' artisan queue:work --tries=2 --max-jobs=100 --max-time=58 > /dev/null 2>&1 &');
$output = shell_exec($php_binary . ' artisan queue:work --tries=2 --max-jobs=100 --max-time=58 > /dev/null 2>&1 &');
$output = shell_exec($php_binary . ' artisan queue:work --tries=2 --max-jobs=100 --max-time=58 > /dev/null 2>&1 &');
$output = shell_exec($php_binary . ' artisan queue:work --tries=2 --max-jobs=100 --max-time=58 > /dev/null 2>&1 &');
$output = shell_exec($php_binary . ' artisan queue:work --tries=2 --max-jobs=100 --max-time=58 > /dev/null 2>&1 &');
$output = shell_exec($php_binary . ' artisan queue:work --tries=2 --max-jobs=100 --max-time=58 > /dev/null 2>&1 &');



// Output any errors or results
echo $output;

