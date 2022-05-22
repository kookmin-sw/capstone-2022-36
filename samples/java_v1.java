public static ImageIcon getImageIcon(String path)
{
  java.net.URL imgURL = GuiImporter.class.getResource(path);

  if (imgURL != null)
  {
    return new ImageIcon(imgURL);
  }
  else
  {
    log.error("Couldn't find icon: " + imgURL);
  }
    return null;

}
