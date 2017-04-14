# Execute the contents of any vendorsetup.sh files we can find.
    for f in `/bin/ls vendor/*/vendorsetup.sh vendor/*/build/vendorsetup.sh device/*
    /*/vendorsetup.sh 2> /dev/null`
        do
              echo "including $f"
        $f done 
     unset f 

