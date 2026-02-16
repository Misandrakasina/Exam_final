<?php

use app\controllers\ApiExampleController;
use app\middlewares\SecurityHeadersMiddleware;
use flight\Engine;
use flight\net\Router;

/** 
 * @var Router $router 
 * @var Engine $app
 */

// This wraps all routes in the group with the SecurityHeadersMiddleware
$router->group('', function(Router $router) use ($app) {

	$router->get('/', function() use ($app) {
		// Serve the index.html from views as the homepage
		$app->response()->header('Content-Type', 'text/html; charset=utf-8');
		$indexPath = __DIR__ . '/../views/index.php';
		if (file_exists($indexPath)) {
			echo file_get_contents($indexPath);
			return;
		}
	});

		$router->get('/page1', function() use ($app) {
		// Serve the index.html from views as the homepage
		$app->response()->header('Content-Type', 'text/html; charset=utf-8');
		$indexPath = __DIR__ . '/../views/page1.php';
		if (file_exists($indexPath)) {
			echo file_get_contents($indexPath);
			return;
		}
		
	});

$router->get('/messages', function() use ($app) {
		// Serve the index.html from views as the homepage
		$app->response()->header('Content-Type', 'text/html; charset=utf-8');
		$indexPath = __DIR__ . '/../views/messages.php';
		if (file_exists($indexPath)) {
			echo file_get_contents($indexPath);
			return;
		}
		
	});


	$router->get('/hello-world/@name', function($name) {
		echo '<h1>Hello world! Oh hey '.$name.'!</h1>';
	});

	$router->group('/api', function() use ($router) {
		$router->get('/users', [ ApiExampleController::class, 'getUsers' ]);
		$router->get('/users/@id:[0-9]', [ ApiExampleController::class, 'getUser' ]);
		$router->post('/users/@id:[0-9]', [ ApiExampleController::class, 'updateUser' ]);
	});
	
});