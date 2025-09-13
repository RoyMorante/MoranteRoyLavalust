<?php
// If the requested file exists in /public, serve it directly
if (php_sapi_name() === 'cli-server') {
    \ = __DIR__ . '/public' . parse_url(\['REQUEST_URI'], PHP_URL_PATH);
    if (is_file(\)) {
        return false;
    }
}
// Otherwise, always load index.php (LavaLust handles routing here)
require __DIR__ . '/public/index.php';
?>
