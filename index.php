<?php
session_start();
require_once '../src/config/config.php';
require_once '../src/includes/functions.php';

// Basic routing
$page = isset($_GET['page']) ? $_GET['page'] : 'home';

// Header
include '../src/includes/header.php';

// Content
switch($page) {
    case 'home':
        include '../src/includes/pages/home.php';
        break;
    case 'menu':
        include '../src/includes/pages/menu.php';
        break;
    case 'cart':
        include '../src/includes/pages/cart.php';
        break;
    default:
        include '../src/includes/pages/404.php';
}

// Footer
include '../src/includes/footer.php';
?>
