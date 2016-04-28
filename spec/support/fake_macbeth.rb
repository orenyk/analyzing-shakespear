class FakeMacbeth
  def self.generate(speeches:)
    ERB.new(self.template).result(binding)
  end

  def self.template
    <<XML
<?xml version="1.0"?>
<!DOCTYPE PLAY SYSTEM "play.dtd">

<PLAY>
  <TITLE>The Tragedy of Macbeth</TITLE>

  <FM>
    <P>Text placed in the public domain by Moby Lexical Tools, 1992.</P>
    <P>SGML markup by Jon Bosak, 1992-1994.</P>
    <P>XML version by Jon Bosak, 1996-1998.</P>
    <P>This work may be freely copied and distributed worldwide.</P>
  </FM>

  <PERSONAE>
    <TITLE>Dramatis Personae</TITLE>

    <PERSONA>DUNCAN, king of Scotland.</PERSONA>

    <PGROUP>
      <% speeches.collect(&:speaker).uniq.each do |speaker| %>
        <PERSONA><%= speaker.upcase %></PERSONA>
      <% end %>
      <GRPDESCR>his buddies.</GRPDSCR>
    </PGROUP>
  </PERSONAE>

  <SCNDESCR>SCENE Scotland: England.</SCNDESCR>

  <PLAYSUBT>MACBETH</PLAYSUBT>

  <ACT>
    <TITLE>ACT I</TITLE>

    <SCENE>
      <TITLE>SCENE I.  A desert place.</TITLE>
      <STAGEDIR>Thunder and lightning. Enter buddies</STAGEDIR>

      <% speeches.each do |speech| %>
        <SPEECH>
          <SPEAKER><%= speech.speaker %></SPEAKER>
          <% speech.lines.each do |line| %>
            <LINE><%= line %></LINE>
          <% end %>
        </SPEECH>
      <% end %>

      <STAGEDIR>Exeunt</STAGEDIR>
    </SCENE>
  </ACT>
</PLAY>
XML
  end
end
