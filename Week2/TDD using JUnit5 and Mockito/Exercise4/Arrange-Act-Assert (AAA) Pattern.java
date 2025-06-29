package com.example;

import org.junit.Before;
import org.junit.After;
import org.junit.Test;

import static org.junit.Assert.*;

public class CalculatorTest {

    private Calculator calculator;

    @Before
    public void setUp() {
        System.out.println("Before each test");
        calculator = new Calculator();
    }

    @After
    public void tearDown() {
        System.out.println("After each test");
        calculator = null;
    }

    @Test
    public void testAdd() {
        
        int result = calculator.add(2, 3);
        assertEquals(5, result);
    }

    @Test
    public void testMultiply() {
        
        int result = calculator.multiply(4, 5);
        assertEquals(20, result);
    }
}
