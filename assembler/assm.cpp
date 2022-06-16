#include <bits/stdc++.h>
#include<iostream>
#include<string>
#include<vector>
#include<fstream>
#include<string.h>
#include<stdio.h>
using namespace std;

struct lables
{
    string lable;
    int line;
};
fstream outfile;
string s_line;
vector<lables> lable;
vector<string>output;
void lable_list(string instruction,int line)
{
    vector<string> instr={"add","sub","and","or","xor","mul","div","lw","sw","beq","bnq","xnor","jump"};

    int i;
    for( i=0;i<13;i++)
    {

        if (instruction.compare(0,instr[i].size(),instr[i])==0)
        {
            return;
        }
    }
    if(i==13)
    {
        istringstream ss(instruction);
        lables tmp;
        ss >> tmp.lable;
        tmp.line=line;
        lable.push_back(tmp);
        //cout<<"__________"<<tmp.lable<<"  "<<tmp.line<<endl;
    }
}

string R_type(string str)
{
    string out;
    string func;
    out+="0x0";
    istringstream ss(str);
    string word;
    ss>>word;
    if(word=="and")
    {
        func='0';
    }
    else if(word=="or")
    {
        func='1';
    }
    else if(word=="xor")
    {
        func='2';
    }
    else if(word=="xnor")
    {
        func='3';
    }
    else if(word=="add")
    {
        func='4';
    }
    else if(word=="sub")
    {
        func='5';
    }
    else if(word=="div")
    {
        func='6';
    }
    else if(word=="mul")
    {
        func='7';
    }
    while(ss>> word)
    {
        int n=stoi(word);
        stringstream s;
        s<< hex <<n;
        string d= s.str();
        out+=d;
    }

    out+=func;

    return out;

}

string I_type(string str)
{
    string out;
    out+="0x";
    istringstream ss(str);
    string word;
    ss>>word;
    if(word=="lw")
    {
        out+='1';
    }
    else if(word=="sw")
    {
        out+='2';
    }
    else if(word=="beq")
    {
        out+='3';
    }
    else if(word=="bne")
    {
        out+='4';
    }
    while(ss>> word)
    {
        int n=stoi(word);
        stringstream s;
        s<< hex <<n;
        string d= s.str();
        out+=d;
    }
    while(out.size()<7)
    {
        out+='0';
    }

    return out;
}
string J_type(string str)
{
    string out;
    out+="0x7";
    istringstream ss(str);
    string word;
    ss>>word;
    ss>>word;
    int n;
    for(int i=0;i<lable.size();i++)
    {
        if(lable.at(i).lable==word)
        {
            n=lable.at(i).line;
        }
    }
    stringstream s;
    s<< hex <<n;
    string d= s.str();
    out+=d;
    while(out.size()<7)
    {
        out+='0';
    }

     return out;
}
string convert(string str)
{
    string out;
    istringstream ss(str);
    string word;
    ss>>word;

    if(word=="and" ||word=="or" ||word=="xor" ||word=="xnor"||word=="add" || word=="sub" ||word=="div" ||word=="mul")
    {
        return R_type(str);

    }
    else if(word=="lw" ||word=="sw" ||word=="beq" ||word=="bne")
    {

        return I_type(str);

    }
    else if(word=="jump")
        {

            return J_type(str);

        }
    else
        {
            str=str.substr(str.find_first_of(" \t")+1);

            convert(str);

        }
}

int main()
{
    vector <string> instruction;
    fstream input_instruction;
    input_instruction.open("input.txt",ios::in);
    string line;
    int line_numner=0;
    while(getline(input_instruction,line))
    {
        instruction.push_back(line);
        lable_list(line,line_numner);
        line_numner++;
    }

    outfile.open("output.txt",ios::trunc| ios::out | ios:: in);
    for(int i=0;i<instruction.size();i++)
    {
       // cout<<i<<"\t";
        outfile << convert(instruction.at(i)) <<endl;
        cout<<convert(instruction.at(i))<<endl;
    }
    return 0;
}
