#include "pch.h"
#include "msmaxUtils.h"

std::wstring GetNameW(INode *n)
{
    return n->GetName();
}

std::string GetName(INode *n)
{
    return mu::ToMBS(n->GetName());
}

std::wstring GetPathW(INode *n)
{
    std::wstring ret;
    if (auto parent = n->GetParentNode())
        ret = GetPathW(parent);
    ret += L'/';
    ret += n->GetName();
    return ret;
}

std::string GetPath(INode *n)
{
    return mu::ToMBS(GetPathW(n));
}

Object * GetBottomObject(INode * n)
{
    return EachObject(n, [](Object*) {});
}
