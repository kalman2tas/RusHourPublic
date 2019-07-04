/*CI test 2*/
public class ByPassConfig {

	public static final String AssocInsert = 'AssocInsert';
    public static final String TooManySOQL = 'TooManySOQL';
    public static final String PPUpdate = 'PPUpdate';
    public static final String PPUpdateFromAssoc = 'PPUpdateFromAssoc';
    public static final String PPCategory = 'PPCategory';
    public static final String Person_Marriage_Change = 'Person_Marriage_Change';
    public static final String Pet_Allow = 'Kitten';
    public static final String Toy_Purchase = 'LEGO';
    
    private static Set<String> bypassMe = new Set<String>();
    
    public static boolean canTrigger(String triggerString){
        return !bypassMe.contains(triggerString);
    }
    
    public static void addBypass(String triggerString){
        bypassMe.add(triggerString);
        System.debug('bypassMe: ' + bypassMe);
    }
    
    public static void removeBypass(String triggerString){
        bypassMe.remove(triggerString);
    }
}