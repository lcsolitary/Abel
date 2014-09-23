#!/usr/bin/expect

set timeout 5
set password 123456

spawn sudo su -c "whoami"
expect {
    "assword" {
        send "$password\r"
        expect {
        "assword" {
            send "$password\r"
        }
        eof { }
        }
    }
    eof { }
}

