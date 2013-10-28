public virtual with sharing class DemoBaseClass1 {
	
	public DemoBaseClass1() {
		
	}

	public Boolean demoBaseClassMethod1() {
		return true;
	}

	public virtual Boolean demoBaseClassOverrideMethod1() {
		return true;
	}

	public virtual String demoBaseClassOverrideMethod2(String value) {
		return value;
	}  

}