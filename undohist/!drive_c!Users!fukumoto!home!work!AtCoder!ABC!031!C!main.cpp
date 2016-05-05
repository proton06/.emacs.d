
((digest . "17acb5e9e05b0d5d36611b7f30ed6cb5") (undo-list nil ("
" . -139) ((marker . 139) . -1) ((marker . 822) . -1) ((marker . 822) . -1) nil ("
" . -140) ((marker . 139) . -1) ((marker . 140) . -1) ((marker . 140) . -1) nil ("// int N;
// int a[50];

// int aChoose(int s){
//     int as = 0;
//     int res = 0;
//     for (int e = 0; e < N; ++e) {
//         if (s == e) continue;
//         int sc = s;
//         if (sc > e) swap(sc, e);
//         int bs = 0;
//         for (int i = sc + 1; i <= e; i+=2) {
//             bs += a[i];
//         }
//         cout << \"  s: \" << sc << endl;
//         cout << \"  e: \" << e << endl;
//         cout << \"  bs: \" << bs << endl;
//         if (bs > as) {
//             as = bs;
//             res = e;
//         }
//     }
//     cout << \"ac: \" << res << endl;
//     return res;
// }

// int solve (){
//     int res = 0;
//     for (int i = 0; i < N; ++i) {
//         int ic = i;
//         cout << \"i: \" << i << endl;
//         int e = aChoose(i);
//         if (ic > e) {
//             swap(ic, e);
//         }
//         int ts = 0;
//         for (int j = ic; j <= e; j+=2) {
//             ts += a[j];
//         }
//         cout << \"ts: \" << ts << endl;
//         res = max(ts, res);
//     }
//     return res;
// }

// int main (int argc, char* argv[]){
//     cin >> N;
//     for (int i = 0; i < N; ++i) {
//         cin >> a[i];
//     }

//     int ts = solve();

//     cout << ts << endl;
    
//     return 0;
// }" . 141) ((marker . 139) . -1263) ((marker . 519) . -10) ((marker . 519) . -10) ((marker . 114) . -587) ((marker . 114) . -587) ((marker . 141) . -527) ((marker . 141) . -527) ((marker . 294) . -327) ((marker . 294) . -327) ((marker . 113) . -606) ((marker . 113) . -606) ((marker . 140) . -540) ((marker . 140) . -540) ((marker . 297) . -287) ((marker . 297) . -287) ((marker . 270) . -410) ((marker . 270) . -410) ((marker . 276) . -369) ((marker . 276) . -369) ((marker . 1) . -709) ((marker . 1) . -709) ((marker . 516) . -25) ((marker . 516) . -25) ((marker . 398) . -157) ((marker . 398) . -157) ((marker . 428) . -124) ((marker . 428) . -124) ((marker . 185) . -503) ((marker . 185) . -503) ((marker . 204) . -479) ((marker . 204) . -479) ((marker . 92) . -611) ((marker . 92) . -611) ((marker . 247) . -453) ((marker . 247) . -453) ((marker . 355) . -239) ((marker . 355) . -239) ((marker . 822) . -549) ((marker . 822) . -549) ((marker . 471) . -87) ((marker . 471) . -87) ((marker . 496) . -67) ((marker . 496) . -67) ((marker . 502) . -48) ((marker . 502) . -48) ((marker . 392) . -180) ((marker . 392) . -180) ((marker . 518) . -24) ((marker . 518) . -24) ((marker . 296) . -314) ((marker . 296) . -314) ((marker . 56) . -629) ((marker . 56) . -629) ((marker . 77) . -612) ((marker . 77) . -612) ((marker . 39) . -649) ((marker . 39) . -649) ((marker . 21) . -686) ((marker . 21) . -686) ((marker . 372) . -216) ((marker . 372) . -216) ((marker) . -1263) ((marker) . -10) 1559 (t 22313 58187 0 0) nil (2345 . 2351) (t 22313 58176 0 0) nil (1950 . 1956) (t 22313 56350 0 0) nil (nil category c->-as-paren-syntax 2317 . 2318) (nil fontified t 2317 . 2318) (nil fontified t 2316 . 2317) (nil face font-lock-type-face 2316 . 2317) (nil fontified t 2315 . 2316) (nil face font-lock-type-face 2315 . 2316) (nil fontified t 2314 . 2315) (nil face font-lock-type-face 2314 . 2315) (nil category c-<-as-paren-syntax 2313 . 2314) (nil fontified t 2313 . 2314) (nil fontified t 2312 . 2313) (nil face font-lock-type-face 2312 . 2313) (nil fontified t 2311 . 2312) (nil face font-lock-type-face 2311 . 2312) (nil fontified t 2310 . 2311) (nil face font-lock-type-face 2310 . 2311) (nil fontified t 2309 . 2310) (nil face font-lock-type-face 2309 . 2310) (nil fontified t 2308 . 2309) (nil face font-lock-type-face 2308 . 2309) (nil fontified t 2307 . 2308) (nil face font-lock-type-face 2307 . 2308) (nil fontified t 2300 . 2307) ("vector<int>" . -2300) (2311 . 2329) nil (nil category c->-as-paren-syntax 2189 . 2190) (nil fontified t 2189 . 2190) (nil fontified t 2188 . 2189) (nil face font-lock-type-face 2188 . 2189) (nil fontified t 2187 . 2188) (nil face font-lock-type-face 2187 . 2188) (nil fontified t 2186 . 2187) (nil face font-lock-type-face 2186 . 2187) (nil category c-<-as-paren-syntax 2185 . 2186) (nil fontified t 2185 . 2186) (nil fontified t 2184 . 2185) (nil face font-lock-type-face 2184 . 2185) (nil fontified t 2183 . 2184) (nil face font-lock-type-face 2183 . 2184) (nil fontified t 2182 . 2183) (nil face font-lock-type-face 2182 . 2183) (nil fontified t 2181 . 2182) (nil face font-lock-type-face 2181 . 2182) (nil fontified t 2180 . 2181) (nil face font-lock-type-face 2180 . 2181) (nil fontified t 2179 . 2180) (nil face font-lock-type-face 2179 . 2180) ("vector<int>" . -2172) (2183 . 2201) nil (nil category c->-as-paren-syntax 1913 . 1914) (nil fontified t 1913 . 1914) (nil fontified t 1912 . 1913) (nil face font-lock-type-face 1912 . 1913) (nil fontified t 1911 . 1912) (nil face font-lock-type-face 1911 . 1912) (nil fontified t 1910 . 1911) (nil face font-lock-type-face 1910 . 1911) (nil category c-<-as-paren-syntax 1909 . 1910) (nil fontified t 1909 . 1910) (nil fontified t 1908 . 1909) (nil face font-lock-type-face 1908 . 1909) (nil fontified t 1907 . 1908) (nil face font-lock-type-face 1907 . 1908) (nil fontified t 1906 . 1907) (nil face font-lock-type-face 1906 . 1907) (nil fontified t 1905 . 1906) (nil face font-lock-type-face 1905 . 1906) (nil fontified t 1904 . 1905) (nil face font-lock-type-face 1904 . 1905) (nil fontified t 1903 . 1904) (nil face font-lock-type-face 1903 . 1904) ("vector<int>" . -1896) (1907 . 1925) nil (nil category c->-as-paren-syntax 1826 . 1827) (nil fontified t 1826 . 1827) (nil fontified t 1825 . 1826) (nil face font-lock-type-face 1825 . 1826) (nil fontified t 1824 . 1825) (nil face font-lock-type-face 1824 . 1825) (nil fontified t 1823 . 1824) (nil face font-lock-type-face 1823 . 1824) (nil category c-<-as-paren-syntax 1822 . 1823) (nil fontified t 1822 . 1823) (nil fontified t 1821 . 1822) (nil face font-lock-type-face 1821 . 1822) (nil fontified t 1820 . 1821) (nil face font-lock-type-face 1820 . 1821) (nil fontified t 1819 . 1820) (nil face font-lock-type-face 1819 . 1820) (nil fontified t 1818 . 1819) (nil face font-lock-type-face 1818 . 1819) (nil fontified t 1817 . 1818) (nil face font-lock-type-face 1817 . 1818) (nil fontified t 1816 . 1817) (nil face font-lock-type-face 1816 . 1817) ("vector<int>" . -1809) (1820 . 1838) nil undo-tree-canary))
