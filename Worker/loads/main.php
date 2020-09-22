<?php

    
    echo "Drift-Shell \nvA.0.0.1\n";

    $new = "launch";
    $i = 1;

    while($i == 1){
        echo "> ";
        $new = readline();
        if ($new == "exit"){
            $i = 0;
            $new = "Exitng Drift-Shell.";
            echo $new."\n";
        }
        else {
            executerLocal($new);
        }
        
    }

    function executerLocal($str){
        
    }
?>