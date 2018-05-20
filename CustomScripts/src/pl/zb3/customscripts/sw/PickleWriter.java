package pl.zb3.customscripts.sw;

import java.io.*;

class PickleWriter extends FilterOutputStream {

    private final DataOutputStream dos;

    public PickleWriter(DataOutputStream out) {
        super(out);
        dos = out;
    }

    public PickleWriter(OutputStream out) {
        super(out);
        dos = new DataOutputStream(out);
    }

    public void writeShort(int v) throws IOException {
        dos.writeShort(Short.reverseBytes((short) v));
    }

    public void writeInt(int v) throws IOException {
        dos.writeInt(Integer.reverseBytes(v));
    }

    public void writeLong(long v) throws IOException {
        dos.writeLong(Long.reverseBytes(v));
    }

    public void writeBytes(String s) throws IOException {
        dos.writeBytes(s);
    }

    public void writeString(String s) throws IOException {
        byte[] bytes = s.getBytes("UTF-8");
        writeInt(bytes.length);
        dos.write(bytes, 0, bytes.length);
    }

    //we override them so we can keep track of written bytes
    
    @Override
    public void write(byte[] b, int off, int len) throws IOException {
        dos.write(b, off, len);
    }

    @Override
    public void write(byte[] b) throws IOException {
        dos.write(b);
    }

    @Override
    public void write(int b) throws IOException {
        dos.write(b);
    }

    public void align32() throws IOException {
        while ((dos.size() & (4 - 1)) != 0) {
            dos.write(0);
        }
    }

    public void align64() throws IOException {
        while ((dos.size() & (8 - 1)) != 0) {
            dos.write(0);
        }
    }

    public int size() {
        return dos.size();
    }

  
}
