package com.example;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class AssertionsTest {

    @Test
    public void testAssertions() {
        
        assertEquals(5, 2 + 3, "2 + 3 should equal 5");

        
        assertTrue(5 > 3, "5 is greater than 3");

        
        assertFalse(5 < 3, "5 is not less than 3");

        
        Object obj1 = null;
        assertNull(obj1, "Object should be null");

        
        Object obj2 = new Object();
        assertNotNull(obj2, "Object should not be null");
    }
}
