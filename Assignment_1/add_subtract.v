module add_subtract(output [3:0]S, output Cout, input m, input [3:0]A,input [3:0]B);

wire a,b,c,d,e,f,g,h,i,j,k,l,n,o,p,q;
wire x,y,z,w,B0,B1,B2,B3;

  xor (B0, B[0], m);
  xor (B1, B[1], m);
  xor (B2, B[2], m);
  xor (B3, B[3], m);


  xor (a, A[0], B0);
  xor (S[0], a, m);
  and (b, A[0], B[0]);
  and (c, B[0], m);
  and (d, m, A[0]);
  or (x, b, c, d);
  
  xor (e, A[1], B1);
  xor (S[1], e, x);
  and (f, A[1], B[1]);
  and (g, B[1], x);
  and (h, x, A[1]);
  or (y, f, g, h);
  
  xor (i, A[2], B2);
  xor (S[2], i, y);
  and (j, A[2], B[2]);
  and (k, B[2], y);
  and (l, y, A[2]);
  or (z, j, k, l);

  xor (n, A[3], B3);
  xor (S[3], n, z);
  and (o, A[3], B[3]);
  and (p, B[3], z);
  and (q, z, A[3]);
  or (w, o, p, q);
  
  xor (Cout, w, m);
  
endmodule
