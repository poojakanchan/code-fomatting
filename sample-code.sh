# add the default one here
    add_lunch_combo generic-eng
    # if we're on linux, add the simulator.  There is a special case
    # in lunch to deal with the simulator
    if ["$(uname)" = "Linux"] ; then
        add_lunch_combo simulator
    fi

