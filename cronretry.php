<?php
// Set the path to your Laravel installation
$path = '/home/customer/www/site.vinovino.ca/public_html';

// Change to the Laravel directory
chdir($path);

// Execute the queue:work command using PHP's shell_exec function
$output = shell_exec('php artisan queue:retry all');

// Output any errors or results
echo $output;
