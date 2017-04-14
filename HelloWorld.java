@Aspect
public class TestAspect {

@Around("execution(* com.itool.HelloWorld.print())")
    public Object myAspect(final ProceedingJoinPoint pjp) 
								throws Throwable{
	System.out.println("Entering method " + pjp.getName());
    	    Object retVal = pjp.proceed();
    	 System.out.println("Exiting method " + pjp.getName());
    	    return retVal;
    }
  }
}
