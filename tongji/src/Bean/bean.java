package Bean;

public class bean
{
    String line;
    String stationName;
    String start;
    String end;

    public bean(String line, String stationName, String start, String end, String stationNum, String stationChange)
    {
        this.line = line;
        this.stationName = stationName;
        this.start = start;
        this.end = end;
        this.stationNum = stationNum;
        this.stationChange = stationChange;
    }

    String stationNum;
    String stationChange;

    public bean()
    {
    }

    public String getStart()
    {
        return start;
    }

    public void setStart(String start)
    {
        this.start = start;
    }

    public String getEnd()
    {
        return end;
    }

    public void setEnd(String end)
    {
        this.end = end;
    }

    public String getLine()
    {
        return line;
    }

    public void setLine(String line)
    {
        this.line = line;
    }

    public String getStationName()
    {
        return stationName;
    }

    public void setStationName(String stationName)
    {
        this.stationName = stationName;
    }

    public String getStationNum()
    {
        return stationNum;
    }

    public void setStationNum(String stationNum)
    {
        this.stationNum = stationNum;
    }

    public String getStationChange()
    {
        return stationChange;
    }

    public void setStationChange(String stationChange)
    {
        this.stationChange = stationChange;
    }
}
