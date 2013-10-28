public with sharing class DemoClass1 extends DemoBaseClass1 implements DemoInterface {

	// properties

	public static Integer demoStaticIntegerProperty = 1;
	public final Integer demoFinalIntegerProperty = 1;
	public static final Integer demoStaticFinalIntegerProperty = 2;
	public String demoStringProperty { get; set; }
	public Integer demoIntegerProperty { get; set; }
	public Boolean demoBooleanProperty { get; set; }
	public List<DemoInnerClass1> innerClasses { get; set; }
	public DemoInnerClass1 anotherInnerClasses { get; set; }

	// constructors 

	public DemoClass1() {
		this('A');
	}

	public DemoClass1(String constructorStringParameter) {
		demoStringProperty = constructorStringParameter;
	}

	public DemoClass1(Integer constructorIntegerParameter) {
		demoIntegerProperty = constructorIntegerParameter;
	}

	public DemoClass1(Boolean constructorBooleanParameter) {
		demoBooleanProperty = constructorBooleanParameter;
	}

	// methods

	public void demoMethod1() {
		demoStringProperty = 'A';
		demoBooleanProperty = true;
		demoIntegerProperty = 5;
	}

	public String demoMethod2() {
		return demoStringProperty;
	}

	public String demoMethod3(String demoMethod3StringParameter) {
		demoStringProperty = demoMethod3StringParameter;
		return demoStringProperty;
	} 
  
	public static Integer demoStaticMethod1() {
		return demoStaticFinalIntegerProperty;
	}

	public override Boolean demoBaseClassOverrideMethod1() {
		return super.demoBaseClassOverrideMethod1();
	}

	public override String demoBaseClassOverrideMethod2(String value) {
		return value + ' override';
	}

	// implement the interface's method
	public Boolean demoInterfaceMethod() {
		return true;
	}

	// inner class

	public class DemoInnerClass1 {

		public String innerClassStringProperty { get; set; }
		public Integer innerClassIntegerProperty { get; set; }
		public Boolean innerClassBooleanProperty { get; set; }

		public String innerClassMethod1() {
			return innerClassStringProperty;
		}

	}

}