#include <fstream>
#include <string>
using namespace std;

int ifContains(char* s, int n) {
    for(int i = 0; i < n-8; i++) {
        string t;
        for(int j = 0; j < 7; j++) {
            t.push_back(s[i+j]);
        }
        if(t == "return ") {
            return i+7;
        }
    }
    return -1;
}

int main() {
    ifstream fin;
    ofstream fout;
    fout.open("out.o");
    fin.open("A1.l");

    char s[80];

    while(fin.eof()==0) {
        fin.getline(s, 80);

        int pos = ifContains(s, sizeof(s)/sizeof(char));
        if(pos != -1) {
            string t;
            while(s[pos] != ' ' && s[pos] != '\n' && s[pos] != ';') {
                t.push_back(s[pos++]);
            }
            fout << t << " ";
        }
    }

    fin.close();
    fout.close();
    return 0;
}