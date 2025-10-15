# Resources / Fonts

Do not version proprietary fonts, and do not forget for open source elements to keep copyrights clear!

## Helvetica Neue

No TTF files of *Helvetica Neue* are versioned here. 
These files are not relevant because *Helvetica Neue* font is available through iOS.

## Helvetica Neue Arabic

> [!CAUTION]
> No true TTF files of Helvetica Neue Arabic is versioned here.
> If you want to get them, download them from the Orange Brand website (https://brand.orange.com/en/brand-basics/typography.

> [!IMPORTANT]
> The three HelveticaNeueLTArabic files here are fakes and only for compilation issues.
> They must have a zero-byte size.
> Do not consider them as Helvetica Neue Arabic fonts, they are not.

If few words, we need to have the *Xcode target* refering to the TTF files to assign them to the *Design System Toolbox* app (though *DesignToolbox* target).
However we cannot have references to files which are missing (because not versioned), it won't compile'.
And the TTF files are in the end copied in our internal forge (internal private GitLab repository) instead of this GitHub repository (public and external, violating terms of uses of Helvetica).

Thus we keep using these fake files, to keep references, and they will be overriden internaly.

List of TTF files for Arabic:
- HelveticaNeueLTArabic-Bold.ttf
- HelveticaNeueLTArabic-Light.ttf
- HelveticaNeueLTArabic-Roman.ttf
