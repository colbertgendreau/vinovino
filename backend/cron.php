<?php
// Set the path to your Laravel installation
$path = '/home/customer/www/site.vinovino.ca/public_html/';

// Change to the Laravel directory
chdir($path);

// Set the PHP binary path
$php_binary = '/usr/local/php81/bin/php-cli';


// Execute the queue:work command using PHP's shell_exec function
$output = shell_exec($php_binary . ' artisan queue:work --daemon');

// Output any errors or results
echo $output;

