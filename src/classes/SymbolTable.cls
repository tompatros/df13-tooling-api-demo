public class SymbolTable {
	
	public enum SymbolVisibility {}

 	public List<Constructor> constructors { get; set; }
    public List<ExternalReference> externalReferences { get; set; }
    public Id id { get; set; }
    public List<SymbolTable> innerClasses { get; set; }
    public List<String> interfaces { get; set; }
    public List<Method> methods { get; set; }
    public String name { get; set; }
    public String key { get; set; }
    public String namespace { get; set; }
    public List<VisibilitySymbol> properties { get; set; }
    public Symbol tableDeclaration { get; set; }
    public List<Symbol> variables { get; set; }

    public class Position {
    	public Integer column { get; set; }
        public Integer line { get; set; }
    }

    public virtual class Symbol {
    	public Position location { get; set; }
        public List<String> modifiers { get; set; }
        public String name { get; set; }
        public List<Position> references { get; set; }
        public String type { get; set; }
    }

    public virtual class VisibilitySymbol extends Symbol {
        public String visibility { get; set; }
    }
    
    // SymbolVisibility = ENUM: GLOBAL | PRIVATE | PUBLIC
    // Modifier = ENUM: STATIC | TEST

    public virtual class Constructor extends VisibilitySymbol {
        public List<Parameter> parameters { get; set; }
     }

     public class Method extends Constructor {
        public String returnType { get; set; }
     }

     public class Parameter {
        public String name { get; set; }
        public String type { get; set; }
     }

     public virtual class ExternalSymbol {
        public String name { get; set; }  
        public List<Position> references { get; set; }
     }

     public class ExternalMethod extends ExternalConstructor {
        public List<String> argTypes { get; set; }
        public String returnType { get; set; }
     }

     public virtual class ExternalConstructor extends ExternalSymbol {
        public List<Parameter> parameters { get; set; }
     }

     public class ExternalReference {
        public List<ExternalMethod> methods { get; set; }
        public String name { get; set; }
        public String namespace { get; set; }
        public List<Position> references { get; set; }
        public List<ExternalSymbol> variables { get; set; }
     }

}