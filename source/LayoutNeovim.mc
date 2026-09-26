import Toybox.Lang;
import Toybox.Graphics;

// Layout "Neovim": code rows around a cursor line that holds the time.
// All numbers are for a 390 px screen and are scaled by Draw.p().
module LayoutNeovim {

    function draw(dc as Dc) as Void {
        var w = dc.getWidth();
        var cx = w / 2;
        var rowX = Draw.p(92);
        var bandY = Draw.p(132);
        var bandH = Draw.p(80);
        var timeX = Draw.p(74);

        Draw.topBar(dc, cx, Draw.p(36), Draw.p(232), Fonts.small, false);
        Draw.text(dc, cx, Draw.p(60), Fonts.row, Theme.c(Theme.MUTED), "-- " + Clock.dateText(true), Graphics.TEXT_JUSTIFY_CENTER);

        row(dc, 2, Draw.p(86), rowX, 0);
        row(dc, 1, Draw.p(112), rowX, 1);

        // Cursor line
        dc.setColor(Theme.c(Theme.LBG), Graphics.COLOR_TRANSPARENT);
        dc.fillRectangle(0, bandY, w, bandH);
        lineNumber(dc, 3, bandY + bandH / 2, true);

        var time = Clock.timeText();
        Draw.text(dc, timeX, bandY + bandH / 2, Fonts.big, Theme.c(Theme.BFG), time, Graphics.TEXT_JUSTIFY_LEFT);
        var secX = timeX + dc.getTextWidthInPixels(time, Fonts.big) + Draw.p(6);
        Draw.text(dc, secX, bandY + bandH / 2 + Draw.p(23), Fonts.row,
                  Theme.c(Theme.ACCENT), Clock.secondsText(), Graphics.TEXT_JUSTIFY_LEFT);

        row(dc, 1, Draw.p(228), rowX, 2);
        row(dc, 2, Draw.p(254), rowX, 3);

        var boxY = Draw.p(278);
        var boxH = Draw.p(52);
        Draw.box(dc, Draw.p(74), boxY, Draw.p(242), boxH, "hr", Fonts.small);
        Draw.graph(dc, Draw.p(82), boxY + Draw.p(10), Draw.p(226), boxH - Draw.p(18));
        Draw.graphAverage(dc, cx, Draw.p(341));

        statusLine(dc, cx, Draw.p(367));
    }

    function row(dc as Dc, n as Number, y as Number, x as Number, slot as Number) as Void {
        lineNumber(dc, n, y, false);
        var id = Theme.slots[slot];
        Draw.row(dc, x, y, Fonts.row, Data.slotLabel(id), Data.slotValue(id), Data.slotUnit(id), Draw.p(70));
    }

    function lineNumber(dc as Dc, n as Number, y as Number, current as Boolean) as Void {
        var colour = current ? Theme.c(Theme.YELLOW) : Theme.c(Theme.MUTED);
        Draw.text(dc, Draw.p(70), y, Fonts.small, colour, n.toString(), Graphics.TEXT_JUSTIFY_RIGHT);
    }

    // Temperature and battery with their icons, no bar around them.
    function statusLine(dc as Dc, cx as Number, y as Number) as Void {
        var tv = Data.tempValue();
        var t = tv == null ? "--" : tv.toString();

        Draw.text(dc, cx - Draw.p(86), y, Fonts.row, Theme.c(Theme.YELLOW), Draw.iconSun(), Graphics.TEXT_JUSTIFY_LEFT);
        Draw.text(dc, cx - Draw.p(64), y, Fonts.row, Theme.c(Theme.FG), t + "°C", Graphics.TEXT_JUSTIFY_LEFT);

        Draw.text(dc, cx + Draw.p(20), y, Fonts.row, Theme.c(Theme.FG), Draw.iconBattery(), Graphics.TEXT_JUSTIFY_LEFT);
        Draw.text(dc, cx + Draw.p(46), y, Fonts.row, Theme.c(Theme.FG), Data.bat.toString() + "%", Graphics.TEXT_JUSTIFY_LEFT);
    }
}
