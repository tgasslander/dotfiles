#!/bin/zsh

# Font awesome icons
PLAY_ICON=
PAUSE_ICON=

# Temp file to store last played song
CACHE_FILE="/tmp/spotify_last_song"

# Get active (non-corked) Spotify sink input if it exists
PLAYING_SINK=$(pactl list sink-inputs | grep -B 20 "application.name = \"Spotify\"" | grep -B 20 "Corked: no" | grep "Sink Input #" | cut -d'#' -f2)

if [ -n "$PLAYING_SINK" ]; then
    # If we found a playing sink, get and show current song
    TITLE=$(qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Metadata | grep "title:" | cut -d' ' -f2-)
    ARTIST=$(qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Metadata | grep "artist:" | cut -d' ' -f2-)
    CURRENT_SONG="$TITLE - $ARTIST"
    
    # Save current song to cache file
    echo "$CURRENT_SONG" > "$CACHE_FILE"

    # Output playing status
    echo "$PLAY_ICON $CURRENT_SONG"
else
    # Check if Spotify is running but paused
    PAUSED_SINK=$(pactl list sink-inputs | grep -B 20 "application.name = \"Spotify\"" | grep "Sink Input #" | head -n 1 | cut -d'#' -f2)

    if [ -n "$PAUSED_SINK" ]; then
        # Spotify is running but paused
        if [ -f "$CACHE_FILE" ]; then
            LAST_SONG=$(cat "$CACHE_FILE")
            echo "$PAUSE_ICON $LAST_SONG"
        else
            echo "$PAUSE_ICON paused"
        fi
    fi
fi

exit 0
