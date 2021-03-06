@isTest
private with sharing class ToDoControllerTest {
    private static Integer listSize = 10;
    private static String toDoCorrectName = 'ToDo 1';
    private static String toDoWrongName = 'Unknown ToDo';
    
    @testSetup
    private static void setup() {
        List<ToDo__c> toDos = new List<ToDo__c>();
        for(Integer i = 1; i <= listSize; i++) {
            toDos.add(new ToDo__c(Name = 'ToDo ' + i));
        }
        insert toDos;
    }
    
    @isTest
    private static void getAllToDosTest() {
        List<ToDo__c> toDos = ToDoController.getAllToDos();
        Test.startTest();
        System.assertEquals(listSize, toDos.size());
        Test.stopTest();
    }
    
    @isTest
    private static void getToDoByNameTestWithCorrectResult() {
        ToDo__c toDo = ToDoController.getToDoByName(toDoCorrectName);
        Test.startTest();
        System.assertEquals(toDoCorrectName, toDo.Name);
        Test.stopTest();
    }
    
    @isTest
    private static void getToDoByNameTestWithEmptyResult() {
        ToDo__c toDo = ToDoController.getToDoByName(toDoWrongName);
        Test.startTest();
        System.assertEquals(null, toDo.Name);
        Test.stopTest();
    }
}