/*
*  Title: SEPバイナリデータファイル(.bin)をメモリ初期化ファイル(.mif)に変換するプログラム
 * Author: Kazuki Hatano
 *
 */

/* header files */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef unsigned short word; /* sep's data type */

int input_bincode(word *paddr, word *pcode);/* input a line */
void convert_line(word addr, word code);/* reassemble a line */
void convert_file(FILE *fp_in);/* reassemble file */

void open_outputfile(char *input_name);	/* open output file */
/* write a SEP-2 re-asemmble language */
void write_instruction(char *write_inst);
void close_outputfile();	/* close output file */

void mif_setting();	/*write mif_setting*/

FILE *fp_in;
/* output file description */
static FILE *fp_out;

int input_bincode(word *paddr, word *pcode)
{
  char *eof_check;
  int addr;
  int code;
  char buf[1024];

  /* ファイルから一行読み込む */
  eof_check = fgets(buf, sizeof(buf), fp_in);
  if (!eof_check) return -1;

  /* 数値へ変換 */
	/*
  if (sscanf(buf, "%8x: %4x\n", &addr, &code) == 2)
    {
      *paddr = (word)addr;
      *pcode = (word)code;
      return 1;
    }
*/
  if (sscanf(buf, "%x: %x\n", &addr, &code) == 2)
    {
      *paddr = (word)addr;
      *pcode = (word)code;
      return 1;
    }
  return 0;
}

/* convert a line */
void convert_line(word addr, word code)
{
  /* 出力バッファ */
  char buf[1024];
  /* 文字列へ変換 */
	sprintf(buf, "%04x: %04x;\n", addr,code);
  /* ファイルへ出力 */
	write_instruction( buf );
}

/* convert file */
void convert_file(FILE *fp_in)
{
  word addr;
  word code;
  char buf[1024];

  /* ファイルから一行読み込む */
  input_bincode(&addr, &code);
  /* 文字列へ変換 */
  sprintf(buf, "%04x: %04x;\n", addr,code);
  /* ファイルへ出力 */
  //write_instruction( buf );
  /*ファイルの終わりまで変換*/
  do {
    convert_line(addr, code);
  } while (input_bincode(&addr, &code) != -1);

  /* 文字列へ変換 */
  strcpy(buf, "END;\n");
  /* ファイルへ出力 */
  write_instruction( buf );
}


/* open output file with filename generated from input filename */
void open_outputfile(char *input_name)
{
  char output_name[256];
  int i, n;

//  if (input_name == NULL) input_name = "Default";

  n = strlen(input_name);
  for (i = n-1; i >= 0; i--)
    {
      if (input_name[i] == '/') break; /* directory separation */
      if (input_name[i] == '.') /* before extension */
	{ input_name[i] = '\0'; break; }
    }
  sprintf(output_name, "%s.mif", input_name);

  fp_out = fopen(output_name, "w");
  if (fp_out == NULL)
    {
      fprintf(stderr, "The output file (%s) can't be opened.", output_name);
      exit(-1);
    }
}

/* write a machine language (binary code) */
void write_instruction(char *write_inst)
{
    fputs(write_inst, fp_out);
}

/* close output file */
void close_outputfile()
{
  fclose(fp_out);
}

/*write mif_setting*/
void mif_setting(){
	
	write_instruction( "WIDTH=16;\n" );
	write_instruction( "DEPTH=63488;\n" ); /* 0000-F7FF */
	write_instruction( "\n" );
	write_instruction( "ADDRESS_RADIX=HEX;\n" );
	write_instruction( "DATA_RADIX=HEX;\n" );
	write_instruction( "\n" );
	write_instruction( "CONTENT BEGIN\n" );

	return;
}

/* main */
int main(int argc, char *argv[])
{
  char *input_name;

  /* no command line arguments */
  if (argc != 2){
    fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
    exit(-1);
  }else{
    input_name = argv[1];
  }

  /* open input file */
  fp_in = fopen(input_name, "r");
	
  if (fp_in == NULL){
    fprintf(stderr, "cannot open file %s\n", input_name);
    exit(-1);
  }

  /* open output SEP-5assembler file */
  open_outputfile(input_name);
  /*mifファイルに必要な設定記述を書き出す*/
  mif_setting();
  /*バイナリデータファイルをmifファイルに書き換える*/
  convert_file(fp_in);

  /* close all file */
  fclose(fp_in);
  close_outputfile();

  return 0;
}


