// create a parser with a class file name to be modified
ClassParser parser = new ClassParser(filename);		
JavaClass javaClass = parser.parse();
ClassGen cg = new ClassGen(javaClass);

// iterate over the methods of the class
   for (Method m : cg.getMethods()) {
       	MethodGen mg = new MethodGen(m, cg.getClassName(), cg.getConstantPool());

	// get the instructions of the method
          	InstructionList il = mg.getInstructionList();

        	// create the instruction set to be added
	InstructionList modiIL=new InstructionList();
modiIL.append(new GETSTATIC(cg.getConstantPool().addFieldref(
    "java.lang.System", "out", "Ljava/io/PrintStream;")));
     modiIL.append(new LDC( cg.getConstantPool().addString 
         	("Calling: "+m + " in class: " + javaClass.getClassName())));
     modiIL.append(new INVOKEVIRTUAL( cg.getConstantPool()
		.addMethodref("java.io.PrintStream","println",   
           "(Ljava/lang/String;)V")));
	
// insert the new instructions in the beginning of the existing instruction set      	il.insert(modiIL);		
	mg.setInstructionList(il);

  // and replace it with the old one
             cg.replaceMethod(m, mg.getMethod());
     }

