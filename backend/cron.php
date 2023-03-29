<?php
// Set the path to your Laravel installation
$path = '/home/customer/www/site.vinovino.ca/public_html/';

// Change to the Laravel directory
chdir($path);

// Set the PHP binary path
$php_binary = '/usr/local/php81/bin/php-cli';

// Get the process ID of any existing queue:work processes
$pid = shell_exec('pgrep -f "artisan queue:work --daemon"');

if ($pid) {
	// If a process ID was returned, kill the existing process
	shell_exec('kill ' . $pid);
}

// Execute the queue:work command using PHP's shell_exec function
$output = shell_exec($php_binary . ' artisan queue:work --daemon');

// Output any errors or results
echo $output;

