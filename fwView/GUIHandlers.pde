// GUI Handlers
public void pbPlay() {
    PLAYING = true;
}

public void pbPause() {
    PLAYING = false;
}

public void pbReset() {
    if (robot != null) {
        robot.reset();
    }
}

public void setPlayback(final float val) {
}