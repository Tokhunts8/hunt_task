<?php

spl_autoload_register(function ($class_name) {
    $array_paths = array(
        '',
        'Base/',
        'Controller/',
        'Model/'
    );
    foreach ($array_paths as $path) {
        $file = sprintf('%s%s.php', $path, $class_name);
        if (is_file($file)) {
            include_once $file;
        }

    }
});


$api = new mainController();

if ($_SERVER['REQUEST_URI'] === '/hunt_task/' || strpos($_SERVER['REQUEST_URI'], '/hunt_task/?offset=') !== false) {
    $offset = isset($_GET['offset']) ? $_GET['offset'] : 0;
    print_r($api->showProjects($offset));
}
elseif ($_SERVER['REQUEST_URI'] === '/hunt_task/skills') {
    print_r($api->showSkills());
}
elseif ($_SERVER['REQUEST_URI'] === '/hunt_task/chart') {
    print_r($api->pieChart());
}
