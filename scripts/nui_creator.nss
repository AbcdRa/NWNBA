#include "nw_inc_nui"
#include "nw_inc_nui_insp"


json createPolylinesDrawList() {
       json drawList = JsonArray();
       int i;
       json color = NuiColor(0, 255,0);
       json thickness =  JsonFloat(1.0);
       for(i = 0; i < 200; i++) {
              json polyline = NuiDrawListPolyLine(NuiBind("cpse"+IntToString(i)), color, JsonBool(FALSE),thickness,
              NuiBind("cps"+IntToString(i)));
              drawList = JsonArrayInsert(drawList, polyline, -1);
       }

       return drawList;
}


void main()
{
       json jcolumn = JsonArray();
       json spacer = NuiSpacer();
       json polylines = createPolylinesDrawList();
       spacer = NuiDrawList(spacer, JsonBool(FALSE), polylines);
       jcolumn = JsonArrayInsert(jcolumn, spacer, -1);
       json root = NuiCol(jcolumn);

       json window = NuiWindow(
              root,
              JsonString("Multik"),
              NuiRect(-1.0,-1.0, 500.0, 500.0),
              JsonBool(TRUE),
              JsonBool(FALSE),
              JsonBool(TRUE),
              JsonBool(FALSE), JsonBool(TRUE)
              );


       int token = NuiCreate(OBJECT_SELF, window, "wtf");
       SendMessageToPC(OBJECT_SELF, "REAL TOKEN = " + IntToString(token));
       NuiSetBind(OBJECT_SELF, token, "cps0", JsonParse("[0.0 0.0 100.0 0.0 100.0 100.0]"));
       NuiSetBind(OBJECT_SELF, token, "cpse0", JsonBool(TRUE));
}
