<?php

return [

    'providers' => array_merge(include(base_path('modules/system/providers.php')), [

        // 'Illuminate\Html\HtmlServiceProvider', // Example
        \LeMaX10\ASail\SailServiceProvider::class,
        'System\ServiceProvider',
    ]),

];
