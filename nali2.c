/**
 * test ip2region searcher program
 *
 * @author  chenxin<chenxin619315@gmail.com>
 * @date    2015-10-30
*/

#include "libip2region/ip2region.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main( int argc, char **argv )
{
    ip2region_entry ip2rEntry;
    datablock_entry datablock;
    char *dbFile = NULL, *algorithm = NULL;
    //char line[256];
    char *line;
    uint_t (*func_ptr)(ip2region_t, const char *, datablock_t);
    double s_time, c_time;
    memset(&datablock, 0x00, sizeof(datablock_entry));

    dbFile      = "ip2region.db";
    algorithm = "B-tree";
    func_ptr  = ip2region_btree_search_string;

    //create a new ip2rObj
    if ( ip2region_create(&ip2rEntry, dbFile) == 0 ) {
        println("Error: Fail to create the ip2region object\n");
        return 0;
    }

        if (argc != 2) {
            line=(char *)malloc(128);//有可能前面有大段非数字字符，所以申请128
            line=fgets(line,128,stdin);
        } else {
            line=argv[1];
        }

        func_ptr(&ip2rEntry, line, &datablock);
        printf("%s\n", datablock.region);

    // destory the ip2rObj
    ip2region_destroy(&ip2rEntry);

    return 0;
}
