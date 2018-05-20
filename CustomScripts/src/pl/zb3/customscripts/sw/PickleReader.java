package pl.zb3.customscripts.sw;

import java.io.*;

//inspired by Guava
public class PickleReader extends FilterInputStream {

    //align should be done via skip
    private int bytesRead = 0;

    public PickleReader(InputStream in) {
        super(in);
    }

    public int readByte() throws IOException {
        int b1 = in.read();

        if (-1 == b1) {
            throw new EOFException();
        }
        bytesRead++;

        return b1;
    }

    public int skipBytes(int n) throws IOException {
        int ret = (int) in.skip(n);
        bytesRead += ret;
        return ret;
    }

    public int readInt() throws IOException {
        int ret = readByte();
        ret |= readByte() << 8;
        ret |= readByte() << 16;
        ret |= readByte() << 24;
        
        return ret;
    }
    
    public long readLong() throws IOException {
        long ret = readInt()& 0xffffffffL;
        ret |= (long)readInt() << 32;
        
        return ret;
    }
}
