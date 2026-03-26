#!/usr/bin/env nu

niri msg --json event-stream | lines | each { |line|
    let event = ($line | from json)
    
    let overview = ($event | get -o OverviewOpenedOrClosed)
    
    if $overview != null {
        let status = if ($overview | describe) =~ "record" {
            $overview.is_open
        } else {
            $overview
        }

        if $status {
            try { eww open bar } | ignore
        } else {
            try { eww close bar } | ignore
        }
    }
} | ignore 
