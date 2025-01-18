#!/bin/zsh

# Font awesome icons
PLAY_ICON=
PAUSE_ICON=

# Temp file to store last played song
CACHE_FILE="/tmp/spotify_last_song"

# Get Spotify sink input
SPOTIFY_SINK=$(pactl list sink-inputs | grep -B 20 "application.name = \"Spotify\"" | grep "Sink Input #" | cut -d'#' -f2)

if [ -n "$SPOTIFY_SINK" ]; then
    # Check if there's audio playing through the sink
    RUNNING=$(pactl list sink-inputs | grep -A 20 "Sink Input #${SPOTIFY_SINK}" | grep "Corked: " | cut -d' ' -f2)
    
    if [ "$RUNNING" = "no" ]; then
        # Get current song info
        TITLE=$(qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Metadata | grep "title:" | cut -d' ' -f2-)
        ARTIST=$(qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Metadata | grep "artist:" | cut -d' ' -f2-)
        CURRENT_SONG="$TITLE - $ARTIST"
        
        # Save current song to cache file
        echo "$CURRENT_SONG" > "$CACHE_FILE"
        
        # Output playing status
        echo "$PLAY_ICON $CURRENT_SONG"
    else
        # Read last played song from cache if available
        if [ -f "$CACHE_FILE" ]; then
            LAST_SONG=$(cat "$CACHE_FILE")
            echo "$PLAY_ICON $PAUSE_ICON $LAST_SONG"
        else
            echo "$PLAY_ICON $PAUSE_ICON paused"
        fi
    fi
fi

exit 0
