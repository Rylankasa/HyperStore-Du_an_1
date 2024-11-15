<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

define('PATH_ROOT', dirname(__DIR__));

session_start();


require_once 'controllers/mainController.php';
require_once 'controllers/productController.php';
require_once 'controllers/commentController.php';
require_once 'controllers/categoryController.php';
require_once 'commons/env.php';
require_once 'commons/function.php';


require_once 'controllers/userController.php';

$action = $_GET['action'] ?? 'home';

switch ($action) {

    case 'home':
        MainController::homeController();
        break;

    case 'category':
        CategoryController::categoryController();
        break;

    case 'addCategory':
        CategoryController::addCategoryController();
        break;

    case 'editCategory':
        $id = $_GET['id'] ?? null;
        if ($id) {
            CategoryController::editCategoryController($id);
        } else {
            echo "Không tìm thấy ID danh mục.";
        }
        break;

    case 'updateCategory':
        CategoryController::updateCategoryController();
        break;

    case 'deleteCategory':
        $id = $_GET['id'] ?? null;
        if ($id) {
            CategoryController::deleteCategoryController($id);
        } else {
            echo "Không tìm thấy ID danh mục để xóa.";
        }
        break;

    case 'editUser':
        UserController::editUserController();
        break;

    case 'storeUser':
        UserController::storeUserController();
        break;

    case 'user':
        UserController::userController();
        break;

    case 'addUser':
        UserController::addUserController();
        break;

    case 'updateUser':
        UserController::updateUserController();
        break;

    case 'deleteUser':
        UserController::deleteUserController();
        break;

    case 'product':
        ProductController::productController();
        break;

    case 'editProduct':
        ProductController::editProductController();
        break;

    case 'deleteProduct':
        ProductController::deleteProductController();
        break;

    case 'addProduct':
        ProductController::addProductController();
        break;

    case 'comment':
        CommentController::commentController();
        break;

    case 'deleteComment':
        CommentController::deleteCommentController();
        break;

    default:
        echo "Trang chủ";
        break;
}
