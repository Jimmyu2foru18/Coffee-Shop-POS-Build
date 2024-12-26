<?php
// Database configuration
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'starbrew');

// Application configuration
define('SITE_NAME', 'StarBrew');
define('SITE_URL', 'http://localhost/starbrew');

// Session configuration
define('SESSION_LIFETIME', 3600); // 1 hour

// Error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Database connection
try {
    $pdo = new PDO(
        "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME,
        DB_USER,
        DB_PASS,
        array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION)
    );
} catch(PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}

// Global functions
function redirect($path) {
    header("Location: " . SITE_URL . "/" . $path);
    exit();
}

function sanitize($input) {
    return htmlspecialchars(strip_tags($input));
}
?>
