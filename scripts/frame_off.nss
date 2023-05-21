void main()
{
    int i;
    for(i = 0; i < 200; i++) {
        NuiSetBind(OBJECT_SELF, 1, "cpse"+IntToString(i), JsonBool(FALSE));
        NuiSetBind(OBJECT_SELF, 1, "cps"+IntToString(i), JsonParse("[]"));
    }
}
