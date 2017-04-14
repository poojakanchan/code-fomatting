# compile java classes

$(hide) tr ' ' '\n' < $(dir $(PRIVATE_CLASS_INTERMEDIATES_DIR))/java-source-list \
    | sort -u > $(dir $(PRIVATE_CLASS_INTERMEDIATES_DIR))/java-source-list-uniq
$(hide) $(TARGET_JAVAC) -encoding ascii $(PRIVATE_BOOTCLASSPATH) \
    $(addprefix -classpath ,$(strip \
        $(call normalize-path-list,$(PRIVATE_ALL_JAVA_LIBRARIES)))) \
    $(PRIVATE_JAVACFLAGS) $(strip $(PRIVATE_JAVAC_DEBUG_FLAGS)) $(xlint_unchecked) \
    -extdirs "" -d $(PRIVATE_CLASS_INTERMEDIATES_DIR) \
    \@$(dir $(PRIVATE_CLASS_INTERMEDIATES_DIR))/java-source-list-uniq \
    || ( rm -rf $(PRIVATE_CLASS_INTERMEDIATES_DIR) ; exit 41 )

# the script below injects custom code into the compiled classes 
   $(ASPECTJ_HOME)/post-compile-weaving.sh  $(PRIVATE_CLASS_INTERMEDIATES_DIR); 

$(hide) rm -f $(dir $(PRIVATE_CLASS_INTERMEDIATES_DIR))/java-source-list
$(hide) rm -f $(dir $(PRIVATE_CLASS_INTERMEDIATES_DIR))/java-source-list-uniq
$(hide) mkdir -p $(dir $@)

# package the compiled classes into jar 
$(hide) jar $(if $(strip $(PRIVATE_JAR_MANIFEST)),-cfm,-cf) \
endif

    $@ $(PRIVATE_JAR_MANIFEST) -C $(PRIVATE_CLASS_INTERMEDIATES_DIR) .

