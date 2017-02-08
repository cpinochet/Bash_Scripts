#!/bin/bash
        for i in `pgrep chrome`;
        do
                echo $i
                # kill -9 $i
        done