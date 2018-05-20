package java.nio;

abstract class DirectByteBuffer extends ByteBuffer {

    public DirectByteBuffer(int mark, int pos, int lim, int cap, byte[] hb, 
            int offset) {
        super(mark, pos, lim, cap, hb, offset);
    }
    public void free() {}
}

public final class NioUtils {
    private NioUtils() {
    }

    public static void freeDirectBuffer(ByteBuffer buffer) {
        if (buffer == null) {
            return;
        }
        ((DirectByteBuffer) buffer).free();
    }

}