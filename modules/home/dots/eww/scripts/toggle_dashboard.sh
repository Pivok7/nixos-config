#!/bin/sh

if eww active-windows | grep -iq "dashboard"; then
    eww close dashboard
else
    eww open dashboard
fi
