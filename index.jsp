<%@ page import="java.lang.management.*" %>
<%@ page import="java.util.*" %>
<html>
<body>
<%!
    long BYTES_IN_MEGABYTE = 1024L * 1024L;

    public long getTotalPhysicalMemorySizeInMB() {
        long memorySizeInMB;
        try {
            long memorySizeInBytes = ((com.sun.management.OperatingSystemMXBean) ManagementFactory
                    .getOperatingSystemMXBean()).getTotalPhysicalMemorySize();

            memorySizeInMB = (memorySizeInBytes / BYTES_IN_MEGABYTE);
        } catch (Exception e) {
            memorySizeInMB = -1L;
        }

        return memorySizeInMB;
    }

    long totalMemory = Runtime.getRuntime().totalMemory();
    long freeMemory = Runtime.getRuntime().freeMemory();
    long usedMemory = totalMemory - freeMemory;
    long maxMemory = Runtime.getRuntime().maxMemory();
    int availableCores = Runtime.getRuntime().availableProcessors();

%>

<table>
    <tr>
        <td>Java version</td>
        <td><%=System.getProperty("java.vendor") + ' ' + System.getProperty("java.version")%></td>
    </tr>
    <tr>
        <td>Operating system</td>
        <td><%=System.getProperty("os.name") + ' ' + System.getProperty("os.version")%></td>
    </tr>
    <tr>
        <td>Server</td>
        <td><%=application.getServerInfo()%></td>
    </tr>
    <tr>
        <td>Memory</td>
        <td>Used <%=usedMemory/BYTES_IN_MEGABYTE%> of <%=totalMemory/BYTES_IN_MEGABYTE%> MB, Max <%=maxMemory/BYTES_IN_MEGABYTE%> MB</td>
    </tr>
    <tr>
        <td>Physica Memory</td>
        <td><%=getTotalPhysicalMemorySizeInMB()%> MB</td>
    </tr>
    <tr>
        <td>CPU Cores</td>
        <td><%=availableCores%></td>
    </tr>
</table>

<table border="0" width="100%">
    <tr><td colspan="2" align="center"><h3>Memory MXBean</h3></td></tr>
    <tr><td width="200">Heap Memory Usage</td><td>
        <%=ManagementFactory.getMemoryMXBean().getHeapMemoryUsage()%>
    </td></tr>

    <tr>
        <td>Non-Heap Memory Usage</td>
        <td><%=ManagementFactory.getMemoryMXBean().getNonHeapMemoryUsage()%></td>
    </tr>
</table>
</body>
</html>
