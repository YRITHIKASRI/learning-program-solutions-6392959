import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;
package com.example;
public class VerifyingInteractions {
   
import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

public class MyServiceTest {

    @Test
    public void testVerifyInteraction() {
        ExternalApi mockApi = mock(ExternalApi.class);
        when(mockApi.getData("abc123")).thenReturn("Mocked Data");

        MyService service = new MyService(mockApi);
        String result = service.fetchData();

        assertEquals("Mocked Data", result);

        verify(mockApi).getData("abc123");
    }
}

}
