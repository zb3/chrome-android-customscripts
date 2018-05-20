// Copyright (c) 2010, Paul Hsieh
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// * Redistributions of source code must retain the above copyright notice, this
//   list of conditions and the following disclaimer.
// * Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
// * Neither my name, Paul Hsieh, nor the names of any other contributors to the
//   code use may not be used to endorse or promote products derived from this
//   software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.
package pl.zb3.customscripts.sw;

public class SuperFastHash {

    private static int get16bits(String key, final int index) {
        return (int) (key.charAt(index) | (key.charAt(index + 1) << 8));
    }

    public static int hash(String key) {
        if (key == null || key.length() == 0) {
            return 0;
        }

        int len = key.length();
        int idx = 0;
        int rem = len & 3;
        int tmp;
        int hash = len;
        len >>>= 2;

        for (; len > 0; len--) {
            hash += get16bits(key, idx);
            tmp = (get16bits(key, idx + 2) << 11) ^ hash;
            hash = (hash << 16) ^ tmp;
            hash += hash >>> 11;
            idx += 4;
        }

        /* Handle end cases */
        switch (rem) {
            case 3:
                hash += get16bits(key, idx);
                hash ^= hash << 16;
                hash ^= key.charAt(idx + 1) << 18;
                hash += hash >>> 11;
                break;
            case 2:
                hash += get16bits(key, idx);
                hash ^= hash << 11;
                hash += hash >>> 17;
                break;
            case 1:
                hash += key.charAt(idx);
                hash ^= hash << 10;
                hash += hash >>> 1;
        }

        hash ^= hash << 3;
        hash += hash >>> 5;
        hash ^= hash << 4;
        hash += hash >>> 17;
        hash ^= hash << 25;
        hash += hash >>> 6;

        return hash;

    }
}
